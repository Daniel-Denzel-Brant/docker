#! /usr/local/bin/PowerShell

[cmdletbinding(DefaultParameterSetName='container')]

param (
	[Parameter(Mandatory = $true)]
	[string]$exec,
    [string]$name='node'	
)
function DockerRun {
    docker run -d -p 3000:3000 --name $name $name;
}

if ($exec -eq $null) {
    $exec = read-host -Prompt "Please enter a command" 
    }


if ($exec -ieq 'start') { 
    
    # Check container
    if ($(docker ps -a -q -f name=$name)){
        Write-Output "The container $name is running";
    }
    else {
        Write-Output "Starting container $name...";
        DockerRun;
    }

} elseif ($exec -ieq 'stop') { 
    
    if ($(docker ps -a -q -f name=$name)){
        Write-Output "Stopping container $name";
        docker container stop $name;
    }
    else {
        Write-Output "The container $name doesn't exist. Here are the current running containers:";
        docker container ls;
    }
    

} elseif ($exec -ieq 'restart') {
    
    if ($(docker ps -a -q -f name=$name)){
        Write-Output "Restarting container $name";
        docker container restart $name;
    }
    else {
        $confirmation = Read-Host "Container $name doesn't exist. Would you like to start it? [y/n]"
        if($confirmation -eq "y") {
            DockerRun;
        }
        else {exit}
    }   
} elseif ($exec -ieq 'delete') { 
    
    if ($(docker ps -a -q -f name=$name)){
        Write-Output "Deleting container $name";
        docker rm $name;
    }
    else {
        $confirmation = Read-Host "Container $name doesn't exist. Would you like to start it? [y/n]"
        if($confirmation -eq "y") {
            DockerRun;
        }
        else {exit}
    }   
}

docker ps -a
