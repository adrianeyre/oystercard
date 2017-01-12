# Oystercard Challenge
### [Makers Academy] (http://www.makersacademy.com) - Week 2 Pair Programming Project

[Project Setup] (#Setup) | [User Story](#Story) | [Files Used] (#Files)

## <a name="Outline">Outline</a>
This week's challenge will start with going back over the basics we covered last week in Boris Bikes, giving you the chance to reinforce what you learned last week. You'll then be challenged to build a more complex system which should really stretch your skills in Ruby, TDD and object-oriented design.

## <a name="Setup">Project Setup</a>
### Gem files used in project
* rspec
* coveralls

### Clone and run project
```
$ git clone https://github.com/adrianeyre/oystercard
$ cd oystercard
$ rspec
```

### Change day branch
```
$ git checkout <branch>
```
where branch is either day-one, day-two, day-three, day-four or day-five

## <a name="Story">User Story</a>
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## <a name="Files">Files Used</a>
```
oysercard.rb    # Class Oystercard to contain information about card features
stations.rb     # Class Station to contain train station features
journey.rb      # Class Journey to contain single journey features
journeylog.rb   # Class JourneyLog to contain all journey log features
```
