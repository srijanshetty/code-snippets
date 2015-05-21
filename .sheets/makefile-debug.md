If you're using GNU make and you need help debugging a makefile then there's a single line your should add. And it's so useful that you should add it to every makefile you create.

It's:

print-%: ; @echo $*=$($*)
It allows you to quickly get the value of any makefile variable. For example, suppose you want to know the value of a variable called SOURCE_FILES. You'd just type:

make print-SOURCE_FILES
If you are using GNU make 3.82 or above it's not even necessary to modify the makefile itself. Just do

make --eval="print-%: ; @echo $*=$($*)" print-SOURCE_FILES
to get the value of SOURCE_FILES. It 'adds' the line above to the makefile by evaluating it. The --eval parameter is a handy way of adding to an existing makefile without modifying it.