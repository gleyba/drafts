

module YZKLogger = 
struct
  
  let level = ref 0

  let log x = 
    print_string x
  
  let debug x = 
    if !level > 0 
    then 
      log x

end