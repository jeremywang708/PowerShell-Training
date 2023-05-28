# Created by Yun Wang(Jeremy) on 2023-05-24.

<#
In this game, you begin in the entrance of a dungeon and make choices 
about where to go. Each room gives you different options, and your 
choices determine where you end up. The goal is to find the treasure room.
#>

<#
.SYNOPSIS
A simple text-based adventure game created with PowerShell.
#>

# Display a welcome message and the game rules
Write-Host "Welcome to the PowerShell Dungeon Adventure Game!"
Write-Host "In this game, you'll explore a dungeon and make choices about where to go."
Write-Host "Just type the option number to make a choice. Good luck!"

# Initial game state
$alive = $true
$room = 1

while ($alive) {
    switch ($room) {
        1 {
            Write-Host "You are in the entrance of the dungeon. There are doors to the east and west. Where do you want to go?"
            Write-Host "1. Go east"
            Write-Host "2. Go west"

            $choice = Read-Host "Enter your choice"

            switch ($choice) {
                1 { $room = 2 }
                2 { $room = 3 }
            }
        }
        2 {
            Write-Host "You are in a long corridor. There is a door at the end. What do you want to do?"
            Write-Host "1. Go back"
            Write-Host "2. Continue"

            $choice = Read-Host "Enter your choice"

            switch ($choice) {
                1 { $room = 1 }
                2 { $room = 4 }
            }
        }
        3 {
            Write-Host "You are in a room with a strange inscription on the wall. The inscription says 'The treasure is to the east.' What do you want to do?"
            Write-Host "1. Go back"
            Write-Host "2. Go east"

            $choice = Read-Host "Enter your choice"

            switch ($choice) {
                1 { $room = 1 }
                2 { $room = 2 }
            }
        }
        4 {
            Write-Host "You've found the treasure room! Congratulations, you've won the game!"

            # End the game
            $alive = $false
        }
    }
}
