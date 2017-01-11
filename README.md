# Oystercard Challenge

This week's challenge will start with going back over the basics we covered last
week in Boris Bikes, giving you the chance to reinforce what you learned last
week. You'll then be challenged to build a more complex system which should
really stretch your skills in Ruby, TDD and object-oriented design.

## Kickoff

In the kickoff and overview of the week, we'll talk about some high level techniques for writing object-oriented code that is easy to understand, easy to reuse, and easy to change.

[Normal kickoff document](./kickoff_and_overview_of_the_week.md)

[January 2017 onsite kickoff document](./kickoff_and_overview_of_the_week_january2017_onsite.md)

## User Stories

Here are the user stories you will be working on for this project:

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

## How to use:
Installation
1) Clone the project
2) Run terminal and change directory to the project directory
3) Run ```bundle``` to install gems

Running the app
4) Enter 'irb' to the terminal 
5) Require the airport.rb file `require './lib/airport.rb'`

Here is an example of what you should see on your terminal 
```
Jaycees-MacBook-Pro:oyster Jaycee$ irb
2.2.3 :001 > require './lib/oystercard' 
 => true 
2.2.3 :002 > oystercard = Oystercard.new
 => #<Oystercard:0x007f8adc1af270 @balance=0, @in_journey=false, @entry_station=nil> 
2.2.3 :003 > oystercard.top_up(2)
 => 2 
2.2.3 :004 > oystercard.touch_in("Bank")
 => "Bank" 
2.2.3 :005 > oystercard.touch_out("A")
 => nil 
```

Please make sure you run line 003 `oystercard.top_up(any integer more than 1)` to have enough balance to run other commands
