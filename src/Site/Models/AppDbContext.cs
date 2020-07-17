using Microsoft.EntityFrameworkCore;

namespace AspNetCoreMVCSample.src.Site.Models
{
     public class AppDbContext : DbContext
     {
        public DbSet<Produto> Produtos { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }
    }
}