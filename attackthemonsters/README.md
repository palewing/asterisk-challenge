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
#<Player:0x00007fb8ee166b98 @name="Vikings", @weapon=Knife, @attribute={:hp=>1.0, :at=>11.0, :df=>4.0, :cc=>0.3}>
#<Monster:0x00007fb8ee165ab8 @type=GolemMonster, @name="yonhm", @weapon=Barehand, @attribute={:hp=>24.0, :at=>3.0, :df=>5.0, :cc=>0.0}>
------------------------------------------------------------------------
Vikings gets the first turn
Vikings attacks yonhm!
yonhm receives 8.5 damage, remaining hp 15.5
yonhm attacks Vikings!
Vikings receives 1.5 damage, remaining hp 0
Vikings is dead!
yonhm wins!
```
