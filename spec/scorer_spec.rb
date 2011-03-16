require 'spec_helper'

describe Scorer do
  describe "score" do
    it "returns a perfect score for identical strings" do
      "Hello World".score("Hello World").should == 1
    end

    it "returns no score for abbreviations with inexistant characters" do
      "hello world".score("hellx").should == 0
      "hello world".score("hello_world").should == 0
    end

    it "returns no score for a non-sequential match" do
      "Hello World".score("WH").should == 0
    end

    it "returns higher score for same case than for wrong case" do
      "Hello World".score("hello").should be < "Hello World".score("Hello")
    end

    it "returns higher score for closer matches" do
      "Hello World".score("H").should be < "Hello World".score("He")
    end

    it "returns a score even with wrong casing" do
      "Hillsdale Michigan".score("himi").should be > 0
    end

    it "returns a higher score for closer matches" do
      "hello world".score("e").should be          < "hello world".score("h")
      "hello world".score("h").should be          < "hello world".score("he")
      "hello world".score("hel").should be        < "hello world".score("hell")
      "hello world".score("hell").should be       < "hello world".score("hello")
      "hello world".score("hello").should be      < "hello world".score("helloworld")
      "hello world".score("helloworl").should be  < "hello world".score("hello worl")
      "hello world".score("hello worl").should be < "hello world".score("hello world")
    end

    it "gives a bonus for consecutive matches" do
      "Hello World".score("Hel").should be  > "Hello World".score("Hld")
    end

    it "gives a bonus for acronyms" do
      "Hello World".score("HW").should be > "Hello World".score("Ho")
      "yet another Hello World".score("yaHW").should be > "Hello World".score("yet another")
      "Hillsdale Michigan".score("HiMi").should be > "Hillsdale Michigan".score("Hil")
      "Hillsdale Michigan".score("HiMi").should be > "Hillsdale Michigan".score("illsda")
      "Hillsdale Michigan".score("HiMi").should be > "Hillsdale Michigan".score("hills")
      "Hillsdale Michigan".score("HiMi").should be < "Hillsdale Michigan".score("hillsd")
    end

    it "gives a bonus for matching beginning of string" do
      "Hillsdale".score("hi").should be > "Chippewa".score("hi")
      "hello world".score("h").should be > "hello world".score("w")
    end

    it "weighs strings properly" do
      "Research Resources North".score("res").should be > "Mary Conces".score('res')
      "Research Resources North".score("res").should be > "Bonnie Strathern - Southwest Michigan Title Search".score('res')
    end

    describe "fuzzy scoring" do
      it "scores fuzzy lower than non-fuzzy" do
        "Hello World".score("Hz", 0.5).should be < "Hello World".score("H", 0.5)
      end

      it "scores mismatch lower" do
        "hello world".score("hello worl", 0.5).should be > "hello world".score("hello wor1", 0.5)
      end

      it "returns fuzzy scores" do
        "Hello World".score("jello", 0.5).should be > 0
      end

      it "returns higher scores for higher fuzziness" do
        "Hello World".score("Hz", 0.9).should be > "Hello World".score("Hz", 0.5)
      end
    end
  end
end
