# Enigma Notes
* Look into refactoring offsets to do get rid of methods and instance variables.
instead one method that does Offsets.new[pos] and adds instance vars offsets to
results and creates instance var encryption_a etc...

* Look into maybe putting methods for setting instvars for offsets and keys in their
respective classes. May cause conflicts that create new keys every time

* Edge Cases
-Message cannot contain unapproved characters
-