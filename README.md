# wetbat-api
**DESIGN PATTERN**
- Table data gateway design pattern

**TECHS**
- .Net Core API
- Azure SQL Database Server

**IDEAS**
- In general, Quote contains all information about the trip, travellers, cost, etc.
- Pickup location can be implemented to add more pickup location such as airports, stations for the arrival
- Trips can be used by various traveller groups.
- Currency to add more details on final cost
- Models should be immutable to keep its integrity
- Ideally, a controller should talk to service instead of repo but this doesn't have any logics rather than retrieving data then the service is not needed here
- Repository injected in ***Startup.cs***

**WHAT HAVE BEEN DONE**
- Get quotes and its related data
- Make it easy to add pick up location (airport, port, etc.) by implementing PickupLocatin Interface
- Traveller group with one responsible party
- Vehicle rental with rate
- Database migration file

**WHAT TO BE ADDED**
- Tests
- Support currency and conversion, you can check my other repository for currency conversion in money transfer: https://github.com/hungnguyenyyc/WorldBank
- Move repository to its own data access
- Hide connection string and log error
