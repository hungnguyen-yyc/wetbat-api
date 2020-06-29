using System;

namespace wetbat_api.Models
{
    public class Contact
    {
        public Contact(Guid _id, string _address, string _phone)
        {
            Id = _id;
            Address = _address;
            Phone = _phone;
        }

        public Guid Id { get; }
        public string Address { get; }
        public string Phone { get; }
    }
}