package filters;

import play.filters.cors.CORSFilter;
import play.http.DefaultHttpFilters;
import javax.inject.Inject;

/**
 * Created by nitin on 2/28/17.
 */
public class Filters extends DefaultHttpFilters {
    @Inject
    public Filters(CORSFilter corsFilter) {
        super(corsFilter);
    }
}