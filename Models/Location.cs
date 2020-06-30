using System;

namespace wetbat_api.Models
{
    public class Location
    {
        public Location(Guid _id, String _cityName, String _country, Currency _currency)
        {
            Id = _id;
            CityName = _cityName;
            Country = _country;
            Currency = _currency;
        }

        public Guid Id { get; }
        public string CityName { get; }
        public string Country { get; }
        public Currency Currency { get; }
    }
}