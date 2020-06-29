using System;

namespace wetbat_api.Models
{
    public class Location
    {
        public Location(Guid _id, String _cityName, String _cityCode, String _country, Currency _currency, PickupLocation[] _pickupLocation)
        {
            Id = _id;
            CityName = _cityName;
            CityCode = _cityCode;
            Country = _country;
            Currency = _currency;
            PickupLocations = _pickupLocation;
        }

        public Guid Id { get; }
        public string CityName { get; }
        public string CityCode { get; }
        public string Country { get; }
        public Currency Currency { get; }
        public PickupLocation[] PickupLocations { get; }
    }
}