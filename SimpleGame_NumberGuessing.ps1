# Created by Yun Wang(Jeremy) on 2023-05-24.

<#
This simple game will prompt you to guess a number. Based on your guess, it will 
tell you if your guess was too high or too low. When you guess correctly, 
it will congratulate you and tell you how many guesses it took to find the correct number.
#>

<#
.SYNOPSIS
A simple number guessing game created with PowerShell.
#>

# Create a random number between 1 and 100
$randomNumber = Get-Random -Minimum 1 -Maximum 100

# Display a welcome message
Write-Host "Welcome to the PowerShell Number Guessing Game!"
Write-Host "Guess a number between 1 and 100."

# Initialize guess count
$guessCount = 0

do {
    # Prompt the user to enter a number
    $userGuess = Read-Host "Enter your guess"

    # Increment guess count
    $guessCount++

    if ($userGuess -lt $randomNumber) {
        Write-Host "Too low! Try again."
    }
    elseif ($userGuess -gt $randomNumber) {
        Write-Host "Too high! Try again."
    }
} while ($userGuess -ne $randomNumber)

# When user guesses correctly, display a success message and the number of attempts
Write-Host "Congratulations! You guessed the number. It took you $guessCount tries."
