<#
Created by Yun Wang(Jeremy) on 2023-05-18, 13:00 p.m.

This function displays a personalized greeting message.
#>

<#
.SYNOPSIS
A function to display a greeting message.

.DESCRIPTION
The Write-GreetingMessage function displays a personalized greeting message.
If a name is provided, the function customizes the message with that name.

.PARAMETER Name
The name of the person to greet.

.PARAMETER Greeting
The greeting message to display.

.EXAMPLE
Write-GreetingMessage -Name "Carl" -Greeting "Good Morning"

This command will output "Carl says 'Good Morning! Jeremy'".
#>
function Write-GreetingMessage {
    param(
        [string]$Name,
        [string]$Greeting = "Hello World"
    )

    $message = "'$Greeting! Jeremy and Carl and Meet'"

    if ($Name) {
        $message = "$Name says " + $message
    }
    Write-Host $message
}
