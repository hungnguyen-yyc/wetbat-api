using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using wetbat_api.Models;
using wetbat_api.Repositories;

namespace wetbat_api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PickupLocationController
    {
        private readonly ILogger<PickupLocationController> _logger;
        private readonly QuoteRepository _repository;

        public PickupLocationController(ILogger<PickupLocationController> logger, QuoteRepository repository)
        {
            _logger = logger;
            _repository = repository;
        }

        [HttpGet]
        public IEnumerable<PickupLocation> Get()
        {
            return _repository.GetPickupLocations().Values.ToList().ToArray();
        }
    }
}