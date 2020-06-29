using System;

namespace wetbat_api.Models
{
    public class VehicleRate
    {
        public VehicleRate(Guid _id, Vehicle _vehicle, Currency _currency, Decimal _amount)
        {
            Id = _id;
            Vehicle = _vehicle;
            Currency = _currency;
            Amount = _amount;
        }

        public Guid Id { get; }
        public Vehicle Vehicle { get; }
        public Currency Currency { get; }
        public decimal Amount { get; }
    }
}