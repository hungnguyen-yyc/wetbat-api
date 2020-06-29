using System;

namespace wetbat_api.Models
{
    public class Transportation
    {
        public Transportation(Guid _id, VehicleRate[] _vehileRate) {
            Id = _id;
            VehileRate = _vehileRate;
        }

        public Guid Id { get; }
        public VehicleRate[] VehileRate { get; }
    }
}