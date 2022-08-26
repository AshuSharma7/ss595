/*API Related Constant */
const APP_NAME = "SIH";
const baseUrl = "https://celestark.herokuapp.com/";

const String sensor = "sensor/";

const String satellite = "satellite/";

const String application = "application/";

const String getTle = "tlebyname/";

const String orbitalElement = "orbital_elements/";

//ERROR Message
const NOINTERNETCONNECTION =
    "No internet connection. Please check your internet connection and try again.";
//Status code 400
const INVALIDREQUEST = "Invalid Request.";
//Status code 401
const UNAUTHORIZEDACCESS = "Unauthorized Access.";
//Status code 403
const FORBIDDENREQUEST = "You don't have permission to access this.";
//Status code 404
const PAGENOTFOUND = "This link is no longer available.";
//Status code 500
const INTERNALSERVER =
    "Internal server error. Please try again after sometime.";
//Status code 503
const SERVERUNAVAILABLE =
    "Internal server error. Please try again after sometime.";
//Other Status Code if any
const OTHERISSUE =
    "Error occured while Communication with Server with StatusCode : ";
