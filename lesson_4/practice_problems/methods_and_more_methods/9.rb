returns { a: 'ant' b: 'bear' }

map checks each pair against the block for truthiness
if true, that element is added to a new collection 
which is returned by the method

in this case, the block ends with value,
  which will always return true unless the value is false or nil

  WRONG