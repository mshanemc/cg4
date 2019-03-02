sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx shane:github:package:install --githubuser mshanemc --repo volvo-base
sfdx shane:github:package:install --githubuser mshanemc --repo platform-event-multiplexer-client
sfdx shane:github:package:install --githubuser mshanemc --repo lightningErrorHandler
sfdx force:user:permset:assign -n VehiclesPerms
sfdx force:apex:execute -f scripts/init.cls

sfdx force:source:push
sfdx force:user:permset:assign -n drive
sfdx force:apex:execute -f scripts/initLocal.cls
sfdx force:user:password:generate
sfdx force:apex:execute -f scripts/initMultiplexer.cls
sfdx shane:org:reauth --requirecustomdomain --json
sfdx force:org:open

# sfdx shane:iot:enable --insights
sfdx shane:iot:activation -n Scheduled_Maintenance -r

sfdx force:data:record:create -s Drive__e -v "Vin__c='YV1DZ8256C2271234' Ending_Odometer__c=200"
