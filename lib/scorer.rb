module Scorer
  def score(abbreviation, fuzziness = nil)
    # If the string is equal to the abbreviation, perfect match.
    return 1 if self == abbreviation

    string = self
    string_length = string.length.to_f
    total_character_score = 0
    common_prefix_bonus = false
    fuzzies = 1

    # Walk through abbreviation and add up scores
    first_char_in_abbreviation = true
    abbreviation.each_byte do |byte|
      # Find the index of current character (case-insensitive) in remaining part
      # of string.
      char = byte.chr
      indexes = [string.index(char.downcase), string.index(char.upcase)]
      indexes = indexes - [nil]
      index_in_string = indexes.min

      if index_in_string
        # Set base score for current character.
        character_score = 0.1
      else
        return 0 unless fuzziness
        fuzzies += 1 - fuzziness
        next
      end

      # Same case bonus.
      character_score += 1 if string[index_in_string] == byte

      # Consecutive letter & start-of-string bonus
      if index_in_string == 0
        # Increase the score when matching first character of the
        # remainder of the string
        character_score += 0.6

        # If match is the first character of the string
        # & the first character of abbreviation, add a
        # start-of-string match bonus.
        common_prefix_bonus = true if first_char_in_abbreviation
      end

      # Acronym Bonus
      # Weighing Logic: Typing the first character of an acronym is as if you
      # preceded it with two perfect character matches.
      if string[index_in_string - 1] == 32  # " ".ord == 32
        character_score += 0.8
      end

      # Left trim the matched part of the string
      # (forces sequential matching).
      string = string.slice(index_in_string + 1, string_length)

      # Add to total character score.
      total_character_score += character_score

      first_char_in_abbreviation = false
    end

    abbreviation_score = total_character_score / abbreviation.length

    # Reduce penalty for longer strings
    percentage_of_matched_string = abbreviation.length / string_length
    word_score = abbreviation_score * percentage_of_matched_string
    final_score = (word_score + abbreviation_score) / 2.0

    # Penalize any fuzzies
    final_score = final_score / fuzzies

    # Award common prefix bonus if possible
    if common_prefix_bonus && (final_score + 0.15 < 1)
      final_score += 0.15
    end

    return final_score
  end
end

class String
  include Scorer
end
