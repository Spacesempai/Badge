/**
 * Created by Alexey Dmytrenko on 11.08.2021.
 */

trigger MaintenanceRequest on Case ( after update) {
    if(Trigger.isUpdate){
        MaintenanceRequestHelper.updateWorkOrders();
    }
}