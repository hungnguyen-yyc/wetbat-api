#nullable enable
using System;

namespace wetbat_api.Models
{
    public class User
    {
        public User(Guid _id, string _firstName, string _lastName, string? _middleName, Contact _contact)
        {
            Id = _id;
            FirstName = _firstName;
            LastName = _lastName;
            MiddleName = _middleName;
            Contact = _contact;
        }

        public Guid Id { get; }
        public string FirstName { get; }
        public string LastName { get; }
        public string? MiddleName { get; }
        public Contact Contact { get; }
    }
}