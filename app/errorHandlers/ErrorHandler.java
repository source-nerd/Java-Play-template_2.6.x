package errorHandlers;
import com.typesafe.config.Config;
import controllers.AssetsFinder;
import play.Environment;
import play.api.OptionalSourceMapper;
import play.api.UsefulException;
import play.api.routing.Router;
import play.filters.csrf.CSRF;
import play.http.DefaultHttpErrorHandler;
import play.mvc.Http;
import play.mvc.Result;
import play.mvc.Results;

import javax.inject.Inject;
import javax.inject.Provider;
import javax.inject.Singleton;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;


@Singleton
public class ErrorHandler extends DefaultHttpErrorHandler{

    @Inject
    AssetsFinder assetsFinder;

    @Inject
    public ErrorHandler(Config config, Environment environment, OptionalSourceMapper sourceMapper, Provider<Router> routes, AssetsFinder assetsFinder) {
        super(config, environment, sourceMapper, routes);
        this.assetsFinder = assetsFinder;
    }

    protected CompletionStage<Result> onProdServerError(Http.RequestHeader request, UsefulException exception) {
        return CompletableFuture.completedFuture(
                Results.internalServerError("A server error occurred: " + exception.getMessage())
        );
    }

    @Override
    public CompletionStage<Result> onClientError(Http.RequestHeader request, int statusCode, String message) {
        if (statusCode == 400) {
            return onBadRequest(request, message);
        } else if (statusCode == 403) {
            return onForbidden(request, message);
        } else if (statusCode == 404) {
            return onNotFound(request, message);
        } else if (statusCode >= 400 && statusCode < 500) {
            return onOtherClientError(request, statusCode, message);
        } else {
            throw new IllegalArgumentException("onClientError invoked with non client error status code " + statusCode + ": " + message);
        }
    }

    protected CompletionStage<Result> onNotFound(Http.RequestHeader request, String message) {
        return CompletableFuture.completedFuture(
                Results.ok(views.html.errorPages.error404.render(assetsFinder))
        );
    }


    protected CompletionStage<Result> onOtherClientError(Http.RequestHeader request, int statusCode, java.lang.String message){
        return CompletableFuture.completedFuture(
                Results.forbidden(views.html.errorPages.error404.render(assetsFinder))
        );
    }
}
