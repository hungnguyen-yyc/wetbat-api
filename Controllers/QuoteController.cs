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
    public class QuoteController
    {
        private readonly ILogger<QuoteController> _logger;
        private readonly QuoteRepository _repository;

        public QuoteController(ILogger<QuoteController> logger, QuoteRepository repository)
        {
            _logger = logger;
            _repository = repository;
        }

        [HttpGet]
        public IEnumerable<Quote> Get()
        {
            return _repository.GetQuotes().ToArray();
        }
    }
}