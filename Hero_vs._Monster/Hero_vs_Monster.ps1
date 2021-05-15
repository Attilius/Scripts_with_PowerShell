
Clear-Host

Write-Output "       ___________________________________________________________________________ " 
Write-Output "      |                _____   __    __  .__.__  .__                            |\|"
Write-Output "      |               /  _  \_/  |__/  |_|__|  | |__|__ __  ______              |\|"
Write-Output "      |              /  /_\  \   __\   __\  |  | |  |  |  \/  ___/              |\|"
Write-Output "      |             /    |    \  |  |  | |  |  |_|  |  |  /\___ \               |\|"
Write-Output "      |             \____|__  /__|  |__| |__|____/__|____//____  >              |\|"
Write-Output "      |                     \/                                 \/               |\|"
Write-Output "      |                                                                         |\|"
Write-Output "      |                                                                         |\|"
Write-Output "      |         Author: Attila Fanczi                                           |\|"
Write-Output "      |         Date: 23.01.2021                                                |\|"
Write-Output "      |         Project name: Hero vs. Monster                                  |\|"
Write-Output "      |         Project type: Game in the PowerShell                            |\|"
Write-Output "      |_________________________________________________________________________|\|"
Write-Output "      \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_|"
Write-Output "      |                                                                           |"
Write-Output "      |###########################################################################|"
Write-Output "      |#        )                                                                #|"
Write-Output "      |#     ( /(                            (  `                   )             #|"
Write-Output "      |#     )\())  (  (          )          )\))(               ( /(  (  (      #|"
Write-Output "      |#    ((_)\  ))\ )(   (    /((  (     ((_)()\  (   (    (  )\())))\ )(     #|"
Write-Output "      |#     _((_)/((_|()\  )\  (_))\ )\    (_()((_) )\  )\ ) )\(_))//((_|()\    #|"
Write-Output "      |#    | || (_))  ((_)((_) _)((_|(_)   |  \/  |((_)_(_/(((_) |_(_))  ((_)   #|"
Write-Output "      |#    | __ / -_)| '_/ _ \ \ V /(_-<_  | |\/| / _ \ ' \)|_-<  _/ -_)| '_|   #|"
Write-Output "      |#    |_||_\___||_| \___/  \_/ /__(_) |_|  |_\___/_||_|/__/\__\___||_|     #|"
Write-Output "      |###########################################################################|"
Write-Output " "
Start-Sleep -s 2
Write-Output "          Once upon a time..."
Start-Sleep -s 2
Write-Output "          A lonely hero set out in search of adventure."
Start-Sleep -s 2
Write-Output "          On her way, he soon stumbled upon a monster."
Start-Sleep -s 2
Write-Output "          The fight was inevitable ..."
Start-Sleep -s 6
Clear-Host

$lifeOfHero = 10;
$lifeOfMonster = 10;
$defaultLife = 10;
$counter = 0;
$winer = ""
$gameTime = 14
$nameOfDefending = ""
$nameOfAttacking = ""


# Initialize spells from a file

$line = Get-Content .\magic_skills.txt
$magic1 = $line[0]
$magic2 = $line[1]
$magic3 = $line[2]
$magic4 = $line[3]
$magic5 = $line[4]
$magic6 = $line[5]

# Starting the fight and launching an attack and counterattack

do {
    $injury = Get-Random -Minimum 1 -Maximum 10
    $lifeOfMonster -= $injury
    $counter++
    $timer = Get-Random -Minimum 1 -Maximum 15
    $gameTime += $timer
    Write-Output "                          # # # # # # # #"
    Write-Output "                          #   ROUND $counter   #"
    Write-Output "                          # # # # # # # #"
    Write-Output " "

    # Simulation of a dice throw during the game for the defender

    function dice_roll($nameOfDefending, $nameOfAttacking) {

        $dice = Get-Random -Minimum 1 -Maximum 6
        switch ($dice) {
            1 {
                $lifeOfMonster = $lifeOfMonster - 1
                $allDamage = $injury + 1
                Start-Sleep -s 2
                Write-Output "      $nameOfDefending found a magic ($magic1)."  
                Start-Sleep -s 2
                Write-Output "          $nameOfAttacking has now the advantage!"
                Start-Sleep -s 2
                Write-Output "              $nameOfDefending was damaged and lost $allDamage health and now has $lifeOfMonster health."
                Start-Sleep -s 1
                Write-Output " "
                $gameTime += 7
            }
            2 {
                $lifeOfHero -= 10
                $lifeOfMonster += $injury
                Start-Sleep -s 2
                Write-Output "       $nameOfDefending found a magic ($magic2)." 
                Start-Sleep -s 2
                Write-Output "           Hahahaha!"
                Start-Sleep -s 2
                Write-Output "              $nameOfDefending used $magic2 magic so the $nameOfAttacking has $lifeOfHero health."
                Write-Output " "
                if ($lifeOfHero -le 0) {
                    $gameTime += 6
                    Start-Sleep -s 0
                    break
                }
            }
            3 {
                $lifeOfMonster += $injury
                Start-Sleep -s 2
                Write-Output "      $nameOfDefending found a magic ($magic3)." 
                Start-Sleep -s 2
                Write-Output "          The heavens are with $nameOfDefending!"
                Start-Sleep -s 2
                Write-Output "              $nameOfDefending with $magic3 defended this attack so him has $lifeOfMonster health."
                Start-Sleep -s 1
                Write-Output " "
                $gameTime += 7
            }
            4 {
                $lifeOfMonster += $injury - 3
                $allDamage = 3
                Start-Sleep -s 2
                Write-Output "      $nameOfDefending found a magic ($magic4)." 
                Start-Sleep -s 2
                Write-Output "          Now the advantage is $nameOfDefending!"
                Start-Sleep -s 2
                Write-Output "              $nameOfDefending with $magic4 defended this attack but he lost $allDamage health and now has $lifeOfMonster health." 
                Start-Sleep -s 1
                Write-Output " "
                $gameTime += 7
            }
            5 {
                $lifeOfMonster += $injury - 2
                $allDamage = 2
                Start-Sleep -s 2
                Write-Output "      $nameOfDefending found a magic ($magic5)." 
                Start-Sleep -s 2
                Write-Output "          Who comrades with the devil it rules the fire!"
                Start-Sleep -s 2
                Write-Output "              $nameOfDefending with $magic4 defended this attack but he lost $allDamage health and now has $lifeOfMonster health." 
                Start-Sleep -s 1
                Write-Output " "
                $gameTime += 7
            }
            6 {
                $lifeOfMonster = $defaultLife
                Start-Sleep -s 2
                Write-Output "      $nameOfDefending found a magic ($magic6)." 
                Start-Sleep -s 2
                Write-Output "          Now the advantage is mine!"
                Start-Sleep -s 2
                Write-Output "              $nameOfDefending recovered from her injury thanks to the magic potion and now has $lifeOfMonster health."
                Start-Sleep -s 1
                Write-Output " "
                $gameTime += 7
            }
            Default { Write-Output "        Hey don't cheat!" }
        }
    }

    # Calling a dice roll function during the game for the monster with (defensive) character

    if ($injury % 3 -eq 0 -and $counter % 2 -ne 0) {
        dice_roll "Monster" "Hero"
    }
    else {
        Start-Sleep -s 2
        Write-Output "      Monster was damaged and lost $injury health and now has $lifeOfMonster health."
        Start-Sleep -s 1
        Write-Output " "
        $gameTime += 3
    }
    if ($lifeOfMonster -gt 0 -and $lifeOfHero -gt 0) {
        Start-Sleep -s 3
        $gameTime += 3
    }
    else {
        Start-Sleep -s 0
        break
    }

    # Launch a counter-attack

    $injury = Get-Random -Minimum 1 -Maximum 10
    $lifeOfHero -= $injury
    $counter++
    $timer = Get-Random -Minimum 1 -Maximum 15
    $gameTime += $timer
    Write-Output "                          # # # # # # # #"
    Write-Output "                          #   ROUND $counter   #"
    Write-Output "                          # # # # # # # #"
    Write-Output " "

    # Calling a dice roll function during the game for the hero with (defensive) character

    if ($injury % 3 -eq 0 -and $counter % 2 -eq 0) {
        dice_roll "Hero" "Monster"
    }
    else {
        Start-Sleep -s 2
        Write-Output "      Hero was damaged and lost $injury health and now has $lifeOfHero health."
        Start-Sleep -s 1
        Write-Output " "
        $gameTime += 3
    }
    if ($lifeOfHero -gt 0 -and $lifeOfMonster -gt 0) {
        Start-Sleep -s 3
        $gameTime += 3
    }
    else {
        Start-Sleep -s 0
        break
    }  
} while ($lifeOfHero -gt 0 -or $lifeOfMonster -gt 0)

# Call for the winner

if ( $lifeOfHero -le 0 ) {
    $winer = "Monster"
    Write-Output "       __  __                 _                                  _ "
    Write-Output "      |  \/  |               | |                                | |"
    Write-Output "      | \  / | ___  _ __  ___| |_ ___ _ __  __      _____  _ __ | |"
    Write-Output "      | |\/| |/ _ \| '_ \/ __| __/ _ \ '__| \ \ /\ / / _ \| '_ \| |"
    Write-Output "      | |  | | (_) | | | \__ \ ||  __/ |     \ V  V / (_) | | | |_|"
    Write-Output "      |_|  |_|\___/|_| |_|___/\__\___|_|      \_/\_/ \___/|_| |_(_)"
}
else { 
    $winer = "Hero"
    Write-Output "       _    _                                      _ "
    Write-Output "      | |  | |                                    | |"
    Write-Output "      | |__| | ___ _ __ ___   __      _____  _ __ | |"
    Write-Output "      |  __  |/ _ \ '__/ _ \  \ \ /\ / / _ \| '_ \| |"
    Write-Output "      | |  | |  __/ | | (_) |  \ V  V / (_) | | | |_|"
    Write-Output "      |_|  |_|\___|_|  \___/    \_/\_/ \___/|_| |_(_)"
}

# Create LOG directory and send summary data or error log to file

if (Test-Path .\LOG) {
    Write-Output "Number of rounds in this game: $counter." >> .\LOG\summary_statistic_log.txt
    Write-Output "Winer of the game: $winer" >> .\LOG\summary_statistic_log.txt
    Write-Output "Game time: $gameTime sec." >> .\LOG\summary_statistic_log.txt
    Get-Date >> .\LOG\summary_statistic_log.txt
    Write-Output "____________________________________________" >> .\LOG\summary_statistic_log.txt
    $error | Select-Object -last 2 >> .\LOG\error_log.txt
}
else {
    mkdir .\LOG
    Write-Output "Number of rounds in this game: $counter." >> .\LOG\summary_statistic_log.txt
    Write-Output "Winer of the game: $winer" >> .\LOG\summary_statistic_log.txt
    Write-Output "Game time: $gameTime sec." >> .\LOG\summary_statistic_log.txt
    Get-Date >> .\LOG\summary_statistic_log.txt
    Write-Output "____________________________________________" >> .\LOG\summary_statistic_log.txt
    $error | Select-Object -last 2 >> .\LOG\error_log.txt
}