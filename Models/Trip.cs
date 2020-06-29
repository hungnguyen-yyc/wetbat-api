using System;

namespace wetbat_api.Models
{
    public class Trip
    {
        public Trip(Guid _id, PickupLocation _departure, PickupLocation _destination, DateTime _startDate, DateTime _toDate) {
            Id = _id;
            Departure = _departure;
            Destination = _destination;
            StartDate = _startDate;
            ToDate = _toDate;
        }

        public Guid Id { get; }
        public PickupLocation Departure { get; }
        public PickupLocation Destination { get; }
        public DateTime StartDate { get; }
        public DateTime ToDate { get; }
    }
}