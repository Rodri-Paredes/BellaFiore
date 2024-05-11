using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BellaFioreDAO.Model
{
    public class baseModel
    {
        public short created_by { get; set; }
        public short updated_by { get; set; }
        public DateTime last_update { get; set; }
        public byte is_active { get; set; } 
        public DateTime creation_date { get; set; }

        public baseModel()
        {

        }

        public baseModel(short created_by, short updated_by, DateTime last_update, byte is_active, DateTime creation_date)
        {
            this.created_by = created_by;
            this.updated_by = updated_by;
            this.last_update = last_update;
            this.is_active = is_active;
            this.creation_date = creation_date;
        }
    }
}
