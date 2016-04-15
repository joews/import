# load the importer
# you could also add the directory that contains import.io to th Io search path.
doFile("../import.io")

"# Import some named properties into the current scope" println
import (a, b, d) from("./module.io")

a println
b println
d println

# C doesn't exist because we didn't import it! if we used doFile it'd be
#  defined here, maybe getting in the way.
"Does c exist? #{hasSlot(\"c\")}" interpolate println

"# Import some named properties into another Object" println
obj := Object clone
obj import (a, c) from ("./module.io")

"obj slotNames: #{obj slotNames join(\",\")}" interpolate println
