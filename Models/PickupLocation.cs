using System;

namespace wetbat_api.Models
{
    public interface PickupLocation
    {
        public Guid Id { get; }
        public string Name { get; }
        public string Code { get; }
        public Location Location { get; }
    }
}