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
        private TravellerGroupTableDataGateway _travellerGroupTableDataGateway;


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
            this._travellerGroupTableDataGateway = new TravellerGroupTableDataGateway();
            
        }

        public List<Quote> GetQuotes() {
            Dictionary<Guid, Trip> trips = this.GetTrips();
            Dictionary<Guid, VehicleRate> VehicleRates = this.GetVehicleRates();
            Dictionary<Guid, List<Traveller>> travellerGroups = this.GetTravellerGroups();
            DataTable data = this._quoteTableDataGateway.GetQuotes();
            List<Quote> quotes = new List<Quote>();
            foreach(DataRow row in data.Rows) {
                Quote quote = new Quote(
                    (Guid)row[nameof(Quote.Id)],  
                    trips[(Guid)row["TripId"]],
                    VehicleRates[(Guid)row["VehicleRateId"]],
                    travellerGroups[(Guid)row["GroupId"]],
                    (decimal)row[nameof(Quote.Amount)],
                    (QuoteStatus)row[nameof(Quote.Status)]
                );
                quotes.Add(quote);
            }
            return quotes;
        }

        private Dictionary<Guid, List<Traveller>> GetTravellerGroups() {
            DataTable data = this._travellerGroupTableDataGateway.GetTravellerGroups();
            Dictionary<Guid, List<Traveller>> result = new Dictionary<Guid, List<Traveller>>();
            Dictionary<Guid, Traveller> travellers = this.GetTravellers();
            foreach (DataRow row in data.Rows)
            {
                Guid groupId = (Guid)row["GroupId"];
                if(!result.ContainsKey(groupId)) {
                    result.Add(groupId, new List<Traveller>());
                    result[groupId].Add(travellers[(Guid)row["TravellerId"]]);
                } else {
                    result[groupId].Add(travellers[(Guid)row["TravellerId"]]);
                }
            }
            return result;
        }

        private Dictionary<Guid, Trip> GetTrips() {
            Dictionary<Guid, Airport> locations = this.GetPickupLocations();
            DataTable tripsData = this._tripTableDataGateway.GetTrips();
            Dictionary<Guid, Trip> trips = new Dictionary<Guid, Trip>();
            foreach(DataRow row in tripsData.Rows) {
                Trip trip = new Trip(
                    (Guid)row[nameof(Trip.Id)],  
                    locations[(Guid)row[nameof(Trip.Departure)]],
                    locations[(Guid)row[nameof(Trip.Destination)]],
                    (DateTime)row[nameof(Trip.StartDate)],
                    (DateTime)row[nameof(Trip.ToDate)] 
                );
                trips.Add(trip.Id, trip);
            }
            return trips;
        }

        private Dictionary<Guid, Contact> GetContacts() {
            DataTable data = this._contactTableDataGateway.GetContacts();
            Dictionary<Guid, Contact> result = new Dictionary<Guid, Contact>();
            foreach(DataRow row in data.Rows) {
                Contact item = new Contact(
                    (Guid)row[nameof(Contact.Id)],
                    (string)row[nameof(Contact.Address)],
                    (string)row[nameof(Contact.Phone)]
                );
                result.Add(item.Id, item);
            }
            return result;
        }

        private Dictionary<Guid, User> GetUsers() {
            DataTable data = this._userTableDataGateway.GetUsers();
            Dictionary<Guid, Contact> contacts = this.GetContacts();
            Dictionary<Guid, User> result = new Dictionary<Guid, User>();
            foreach(DataRow row in data.Rows) {
                User item = new User(
                    (Guid)row[nameof(User.Id)],
                    (string)row[nameof(User.FirstName)],
                    (string)row[nameof(User.LastName)],
                    row[nameof(User.MiddleName)] == null ? (string)row[nameof(User.MiddleName)] : null,
                    contacts[(Guid)row["ContactId"]]
                );
                result.Add(item.Id, item);
            }
            return result;
        }

        private Dictionary<Guid, Traveller> GetTravellers() {
            DataTable data = this._travellerTableDataGateway.GetTravellers();
            Dictionary<Guid, User> users = this.GetUsers();
            Dictionary<Guid, Traveller> result = new Dictionary<Guid, Traveller>();
            foreach(DataRow row in data.Rows) {
                Traveller item = new Traveller(
                    (Guid)row[nameof(Traveller.Id)],
                    users[(Guid)row["UserId"]],
                    (bool)row[nameof(Traveller.IsResponsibleParty)]
                );
                result.Add(item.Id, item);
            }
            return result;
        }

        private Dictionary<Guid, VehicleRate> GetVehicleRates() {
            DataTable data = this._vehicleRateTableDataGateway.GetVehicleRates();
            Dictionary<Guid, VehicleRate> result = new Dictionary<Guid, VehicleRate>();
            foreach(DataRow row in data.Rows) {
                VehicleRate item = new VehicleRate(
                    (Guid)row[nameof(VehicleRate.Id)],
                    (Vehicle)row[nameof(VehicleRate.Vehicle)],
                    (Currency)row[nameof(VehicleRate.Currency)],
                    (decimal)row[nameof(VehicleRate.Amount)]
                );
                result.Add(item.Id, item);
            }
            return result;
        }

        private Dictionary<Guid, Location> GetLocations() {
            DataTable locationDataTable = this._locationTableDataGateway.GetLocations();
            Dictionary<Guid, Location> locations = new Dictionary<Guid, Location>();
            foreach(DataRow row in locationDataTable.Rows) {
                Location location = new Location(
                    (Guid)row[nameof(Location.Id)],  
                    (string)row[nameof(Location.CityName)],
                    (string)row[nameof(Location.Country)],
                    (Currency)row[nameof(Location.Currency)]    
                );
                locations.Add(location.Id, location);
            }
            return locations;
        }

        private Dictionary<Guid, Airport> GetPickupLocations() {
            DataTable airportDataTable = this._airportTableDataGateway.GetAirports();
            Dictionary<Guid, Airport> airports = new Dictionary<Guid, Airport>();
            Dictionary<Guid, Location> locations = this.GetLocations();
            foreach(DataRow row in airportDataTable.Rows) {
                Airport pickupLocation = new Airport(
                    (Guid)row[nameof(pickupLocation.Id)],
                    (string)row[nameof(PickupLocation.Name)],
                    (string)row[nameof(PickupLocation.Code)],
                    locations[(Guid)row["LocationId"]]
                );
                airports.Add(pickupLocation.Id, pickupLocation);
            }
            return airports;
        }
    }
}