require "pry"
class Person 
    attr_reader :name , :happiness, :hygiene
    attr_accessor :bank_account
    def initialize (name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end
    def hygiene= (value)
        @hygiene = value.clamp(0, 10)
    end
    def happiness= (value)
        @happiness = value.clamp(0, 10)
    end
    def clean?
        self.hygiene > 7
    end
    def happy?
        self.happiness >7
    end
    def get_paid(amount)
        self.bank_account += amount
        "all about the benjamins"
    end
    def take_bath
        self.hygiene += 4
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end
    def work_out 
        self.hygiene -=3
        self.happiness += 2
        "♪ another one bites the dust ♫"
    end
    def call_friend (friend)
        self.happiness +=3
       if  friend.is_a?(Person) 
           friend.happiness +=3 
           "Hi #{friend.name}! It's #{self.name}. How are you?"
       #rescue the application from the error
       else
         raise FriendError
        end
        rescue FriendError => error
         puts error.message
        end
    #add custom error when the friend is not an instance of the Person class
    class FriendError < StandardError
        def message
            "you must give the call_friend method an argument of an instance of the person class!"
          end
    end
    def start_conversation(friend, topic)
        case topic
        when topic ="politics" 
           self.happiness -= 2
           friend.happiness -= 2
           "blah blah partisan blah lobbyist"
        when topic ="weather"
            self.happiness += 1
            friend.happiness += 1
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end
end

donvine = Person.new("donvine")
puts donvine.name
mary = Person.new("mary")
donvine.call_friend("john")
puts mary.name
# binding.pry
