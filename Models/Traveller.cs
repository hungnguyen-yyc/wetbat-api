using System;

namespace wetbat_api.Models
{
    public class Traveller
    {
        public Traveller(Guid _id, User _user, bool _isResponsibleParty)
        {
            Id = _id;
            User = _user;
            IsResponsibleParty = _isResponsibleParty;
        }

        public Guid Id { get; }
        public User User { get; }
        public bool IsResponsibleParty { get; }
    }
}