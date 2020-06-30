using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using wetbat_api.Models;
using wetbat_api.Repositories;

namespace wetbat_api.Repositories
{
    public class QuoteRepository
    {
        private AirportTableDataGateway _airportTableDataGateway;
        private ContactTableDataGateway _contactTableDataGateway;
        private LocationTableDataGateway _locationTableDataGateway;
        private QuoteTableDataGateway _quoteTableDataGateway;
        private TravellerTableDataGateway _travellerTableDataGateway;
        private TripTableDataGateway _tripTableDataGateway;
        private VehicleRateTableDataGateway _vehicleRateTableDataGateway;
        private UserTableDataGateway _userTableDataGateway;


        // no need for dependency injection as table data gateways suppose to be simple
        public QuoteRepository()
        {
            this._airportTableDataGateway = new AirportTableDataGateway();
            this._contactTableDataGateway = new ContactTableDataGateway();
            this._locationTableDataGateway = new LocationTableDataGateway();
            this._quoteTableDataGateway = new QuoteTableDataGateway();
            this._travellerTableDataGateway = new TravellerTableDataGateway();
            this._tripTableDataGateway = new TripTableDataGateway();
            this._vehicleRateTableDataGateway = new VehicleRateTableDataGateway();
            this._userTableDataGateway = new UserTableDataGateway();
            
        }

        public Dictionary<Guid, Airport> GetPickupLocations() {
            DataTable airportDataTable = this._airportTableDataGateway.GetAirports();
            Dictionary<Guid, Airport> airports = new Dictionary<Guid, Airport>();
            foreach(DataRow row in airportDataTable.Rows) {
                Location location = new Location(
                    (Guid)row["LocationId"],  
                    (string)row[nameof(Location.CityName)],
                    (string)row[nameof(Location.Country)],
                    (Currency)row[nameof(Location.Currency)]    
                );
                Airport pickupLocation = new Airport(
                    (Guid)row["PickupLocationId"],
                    (string)row[nameof(PickupLocation.Name)],
                    (string)row[nameof(PickupLocation.Code)],
                    location
                );
                airports.Add(pickupLocation.Id, pickupLocation);
            }
            return airports;
        }
    }
}