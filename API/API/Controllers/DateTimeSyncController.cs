using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DateTimeSyncController : ControllerBase
    {
        [HttpPost]
        public IActionResult SyncDateTime(string timeZoneId)
        {
            try
            {
                TimeZoneInfo newTimeZone = TimeZoneInfo.FindSystemTimeZoneById(timeZoneId);
                DateTime newDateTime = TimeZoneInfo.ConvertTime(DateTime.Now, newTimeZone);
                System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("");
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("");
                return Ok(newDateTime);
            }
            catch (Exception ex)
            {
                return BadRequest($"Error: {ex.Message}");
            }
        }
    }
}
