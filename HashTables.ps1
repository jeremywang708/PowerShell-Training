<# 
Created by Yun Wang(Jeremy) on 2023-05-23, 10:00 a.m.
#>

<# 
Hashtable stores key/value pairs in a hash table. When using a Hashtable, 
you specify an object that is used as a key, and the value that you want 
linked to that key. Generally we used String or numbers as keys.

Declaring hashtable Variables
To use an hashtable in a program, you must declare a variable to reference 
the hashtable. Here is the syntax for declaring an hashtable variable −

syntax:
$hash = @{ ID = 1; Shape = "Square"; Color = "Blue"} OR $hash = @{}

Note − Ordered dictionaries can be created using similar syntax. Ordered 
dictionaries maintain the order in which entries are added whereas hashtables do not.

example:
$hash = [ordered]@{ ID = 1; Shape = "Square"; Color = "Blue"}

Print the hashtable: $hashtable

The hashtable values are accessed through the keys: $hash["ID"]

Dot notation can be used to access hashtables keys or values: $hash.keys OR $hash.values
#>


# Declare a hashtable variable
$hash = [ordered]@{ID = 1; Name = "Jeremy"; Gender = "Male"; NOC = "Student"}

# Print all the hashtable keys
write-host("Print all hashtable keys")
$hash.keys

# Print all the hashtable values
write-host("Print all hashtable values")
$hash.values

# Get the value of a specific key
write-host("Get ID")
$hash["ID"]

# Print the size of the hashtable
write-host("Print Size")
$hash.Count

# Add a new key-value pair to the hashtable
write-host("Add key-value")
$hash.Add("New", "Key")

# Print the updated hashtable and its new size
write-host("Print new hashtable and its size")
$hash
$hash.Count

# Update an existing key's value
write-host("Update the value of 'New' key")
$hash["New"] = "Updated Value"
$hash

# Remove a key-value pair from the hashtable
write-host("Remove the 'New' key-value pair")
$hash.Remove("New")
$hash

# Check if a specific key exists
write-host("Check if 'ID' key exists")
$exists = $hash.ContainsKey("ID")
$exists

# Check if a specific value exists
write-host("Check if 'Jeremy' value exists")
$exists = $hash.ContainsValue("Jeremy")
$exists

# Iterate over each key-value pair in the hashtable
write-host("Iterate over each key-value pair")
foreach ($key in $hash.Keys) {
    $value = $hash[$key]
    write-host("Key: $key, Value: $value")
}

# Clear the hashtable
write-host("Clear the hashtable")
$hash.Clear()
$hash

# Populate the hashtable with a loop
write-host("Populate the hashtable with a loop")
for ($i = 0; $i -lt 50; $i++) {
    $hash.Add("Key$i", "Value$i")
}
$hash

# Check the size of the hashtable after populating it
write-host("Print the size of the populated hashtable")
$hash.Count

# Retrieve and remove the first entry
write-host("Retrieve and remove the first entry")
$firstKey = $hash.keys[0]
$firstValue = $hash[$firstKey]
$hash.Remove($firstKey)
write-host("First Key: $firstKey, First Value: $firstValue")
$hash

# Retrieve and remove the last entry
write-host("Retrieve and remove the last entry")
$lastKey = $hash.keys[-1]
$lastValue = $hash[$lastKey]
$hash.Remove($lastKey)
write-host("Last Key: $lastKey, Last Value: $lastValue")
$hash
