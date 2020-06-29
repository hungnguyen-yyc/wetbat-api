using System;
using System.Collections.Generic;

namespace wetbat_api.Models
{
    public class Quote
    {
        public Quote(Guid _id, Trip _trip, VehicleRate _vehicleRate, List<Traveller> _travellers, decimal _amount, QuoteStatus _status)
        {
            Id = _id;
            Trip = _trip;
            VehicleRate = _vehicleRate;
            Travellers = _travellers;
            Amount = _amount;
            Currency = _trip.Destination.Location.Currency;
            Status = _status;
        }

        public Guid Id { get; }
        public Trip Trip { get; }
        public VehicleRate VehicleRate { get; }
        public List<Traveller> Travellers { get; }
        public Traveller ReponsibleTraveller {
            get {
                return this.Travellers.Find((Traveller traveller) => { return traveller.IsResponsibleParty; });
            }
        }
        public decimal Amount { get; }
        public Currency Currency { get; }
        public QuoteStatus Status { get; }
    }
}