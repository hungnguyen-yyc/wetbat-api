using System;

namespace wetbat_api.Models
{
    public class Airport : PickupLocation
    {
        public Airport(Guid _id, string _name, string _code, Location _location) {
            Id = _id;
            Name = _name;
            Code = _code;
            Location = _location;
        }

        public Guid Id { get; }
        public string Name { get; }
        public string Code { get; }
        public Location Location { get; }
    }
}