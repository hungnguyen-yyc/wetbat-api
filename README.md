# wetbat-api
DESIGN PATTERN
Table data gateway design pattern

ASSUMPTION
From one airport to another

WHAT HAVE BEEN DONE
- Get quotes and its related data
- Make it easy to add pick up location (airport, port, etc.) by implementing PickupLocatin Interface
- Traveller group with one responsible party idea
- Vehicle rental with rate

WHAT TO BE ADDED
- Tests
- Currency conversion with, you can check my other repository for currency conversion in money transfer: https://github.com/hungnguyenyyc/WorldBank
- Move repository to its own data access
- Support multiple vehicle rates

NOTES
Models should be immutable to keep its integrity
Ideally, a controller should talk to service instead of repo but this doesn't have any logics rather than retrieving data then the service is not needed here

