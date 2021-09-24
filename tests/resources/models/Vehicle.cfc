/**
 * Interact with NHTSA Vehicles API
 *
 * @author Michael Born michael@ortussolutions.com
 * @date 04/15/2021
 * @cite https://vpic.nhtsa.dot.gov/api/
 */
component accessors="true" {

    property name="apiURL" default="https://vpic.nhtsa.dot.gov/api/vehicles";

    /**
     * Instantiate the vehicle
     */
    public function init() {
        return this;
    }

    /**
     * Retrieve all known vehicle makes
     *
     * @format set the response format to json,csv, or xml.
     * @returns manufacturer data in a `{ results : [] }` format.
     */
    public struct function getAllMakes(string format = 'json') {
        var data = cfhttp(url = '#variables.apiURL#/getallmakes?format=#arguments.format#');
        return deserializeJSON(data.fileContent);
    }

    /**
     * Retrieve all known vehicle manufacturers
     *
     * @format set the response format to json,csv, or xml.
     * @returns manufacturer data in a `{ results : [] }` format.
     */
    public struct function getAllManufacturers(string format = 'json', numeric page = '1') {
        var data = cfhttp(
            url = '#variables.apiURL#/getallmanufacturers?format=#arguments.format#&page=#arguments.page#'
        );
        return deserializeJSON(data.fileContent);
    }

    /**
     * Retrieve details for the given manufacturer
     *
     * @manufacturer Filter by manufacturer name. Must match a manufacturer name in {@see getallmanufacturers} response.
     * @format set the response format to json,csv, or xml.
     * @returns manufacturer data in a `{ results : [] }` format.
     */
    public struct function getManufacturerDetails(required string manufacturer, string format = 'json') {
        var data = cfhttp(
            url = '#variables.apiURL#/getmanufacturerdetails/#arguments.manufacturer#?format=#arguments.format#'
        );
        return deserializeJSON(data.fileContent);
    }

}
