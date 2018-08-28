sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx shane:github:package:install --githubuser mshanemc --repo volvo-base
sfdx force:user:permset:assign -n VehiclesPerms
sfdx force:apex:execute -f scripts/init.cls

sfdx force:source:push
sfdx force:user:permset:assign -n drive
# sfdx shane:iot:enable --insights
sfdx force:org:open