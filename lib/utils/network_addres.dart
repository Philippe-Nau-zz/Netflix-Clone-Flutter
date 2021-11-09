class NetworkAddres{
static const kApiKey = 'b864df85a849c092abeb6c585a550aa4';
static const kBaseUrl = 'https://api.themoviedb.org/3';
static Uri kNetflixOriginal = Uri.parse('$kBaseUrl/discover/tv?with_network=213&language=pt-BR&api_key=$kApiKey');
static Uri kNetflixTrending = Uri.parse('$kBaseUrl/trending/all/week?language=pt-BR&api_key=$kApiKey');
static Uri kNetflixTop = Uri.parse('$kBaseUrl/movie/top_rated?language=pt-BR&api_key=$kApiKey');
static Uri kNetflixAction = Uri.parse('$kBaseUrl/discover/movie?with_genres=28&language=pt-BR&api_key=$kApiKey');
static Uri kNetflixComedy = Uri.parse('$kBaseUrl/discover/movie?with_genres=35&language=pt-BR&api_key=$kApiKey');
static Uri kNetflixHorror = Uri.parse('$kBaseUrl/discover/movie?with_genres=27&language=pt-BR&api_key=$kApiKey');
static Uri kNetflixRomance = Uri.parse('$kBaseUrl/discover/movie?with_genres=10749&language=pt-BR&api_key=$kApiKey');
static Uri kNetflixDocumentary = Uri.parse('$kBaseUrl/discover/movie?with_genres=99&language=pt-BR&api_key=$kApiKey');
static const kNetflixImgRow = 'https://image.tmdb.org/t/p/w200';
static const kNetflixFeatured = 'https://image.tmdb.org/t/p/original';
}