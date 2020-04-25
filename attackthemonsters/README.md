## Phase 3 Question
Add 1 new weapon
* How many file changes? 0
* How many new files? 1 (exclude spec)
Add 1 new monster type
* How many file changes? 0
* How many new files? 1 (exclude spec)
## Installing
```
git clone https://github.com/palewing/asterisk-challenge.git && cd asterisk-challenge/attackthemonsters
```
## Running the game
Inside attackthemonsters directory
```
ruby start.rb
```
## Example Output
```
#<Player:0x00007fa0c7986a88 @name="Spaghetti", @weapon=Barehand, @attribute={:hp=>15, :at=>8, :df=>8, :cc=>0}>
#<Monster:0x00007fa0c79868f8 @type=GolemMonster, @name="mnsak", @weapon=Barehand, @attribute={:hp=>10.8, :at=>3, :df=>9, :cc=>0}>
------------------------------------------------------------------------
mnsak gets the first turn
mnsak attacks Spaghetti!
Spaghetti receives 1.5 damage, remaining hp 13.5
Spaghetti attacks mnsak!
mnsak receives 4.0 damage, remaining hp 6.800000000000001
mnsak attacks Spaghetti!
Spaghetti receives 1.5 damage, remaining hp 12.0
Spaghetti attacks mnsak!
mnsak receives 4.0 damage, remaining hp 2.8000000000000007
mnsak attacks Spaghetti!
Spaghetti receives 1.5 damage, remaining hp 10.5
Spaghetti attacks mnsak!
mnsak receives 4.0 damage, remaining hp -1.1999999999999993
mnsak is dead!
Spaghetti wins!
```
