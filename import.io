#
# Import named slots from a given file onto the receiver
#
Object import := method(
  # return an object that responds to `from`
  withFrom := Object clone
  
  # the object to install imported names onto
  withFrom target := self

  # The named imports are bare messages, so use their names
  withFrom namesToImport := call message arguments map(t, t name)

  withFrom from := method(file,
    #import the full file into surrogate 
    surrogate := Object clone
    surrogate doFile(file)
   
    # set the named import slots onto the target object
    # TODO throw if an imported name was not found?
    surrogate slotNames intersect(namesToImport) foreach(nameToImport,
      target setSlot(nameToImport, surrogate getSlot(nameToImport))
    )
  )
  
  withFrom
)
