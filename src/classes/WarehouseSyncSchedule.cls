/**
 * Created by Alexey Dmytrenko on 10.08.2021.
 */
global class WarehouseSyncSchedule implements Schedulable {


    global void execute(SchedulableContext ctx) {


       System.enqueueJob(new WarehouseCalloutService()) ;


    }


}