namespace wetbat_api.Models
{
    public class Quote
    {
        public Quote(Trip _trip, Transportation _transaportation, Traveller _traveller, decimal _amount, QuoteStatus _status)
        {
            Trip = _trip;
            Transaportation = _transaportation;
            Traveller = _traveller;
            Amount = _amount;
            Currency = _trip.Destination.Currency;
            Status = _status;
        }

        public Trip Trip { get; }
        public Transportation Transaportation { get; }
        public Traveller Traveller { get; }
        public decimal Amount { get; }
        public Currency Currency { get; }
        public QuoteStatus Status { get; }
    }
}