# Created by Yun Wang(Jeremy) on 2023-05-19, 10:00 a.m.

<#
.SYNOPSIS
   This script demonstrates several functionalities of arrays in PowerShell. 
.DESCRIPTION
   The script checks if certain elements exist in the array, iterates over the array,
   adds elements to the array, removes elements, and finally sorts the array. 
#>

function Test-ArrayFunctionality {
    param(
        [string]$Name,
        [string]$Greeting = "Hello World"
    )

    # Generates a greeting message
    $message = "'$Greeting! Jeremy'"

    # Personalize the message if a name is provided
    if ($Name) {
        $message = "$Name says " + $message
    }

    # Print the greeting message
    Write-Host $message

    # Create a new array with numbers from 1 to 10
    $array = @(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

    # Check if the array contains a certain number
    $contains = $array -contains 3

    # Print a message indicating whether or not the array contains the number
    if ($contains) {
        Write-Host "Array contains 3"
    } else {
        Write-Host "Array does not contain 3"
    }

    # Iterate over each item in the array and print it
    foreach ($item in $array) {
        Write-Host "Item: $item"
    }

    # Add a new item to the array
    $array += 11

    # Check and print the array's length
    $length = $array.Count
    Write-Host "Array length: $length"

    # Remove a specific item from the array by creating a new array that excludes the item
    $array = $array | Where-Object { $_ -ne 3 }

    # Check and print the array's length after the removal
    $length = $array.Count
    Write-Host "Array length after removal: $length"

    # Sort the array
    $array = $array | Sort-Object

    # Print the sorted array
    Write-Host "Sorted array: $($array -join ', ')"
}
