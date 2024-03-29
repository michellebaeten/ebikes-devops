@isTest
public class TestOrderController {
    //comment added
    @testSetup
    static void setup() {
        Account acc = new Account(Name = 'Sample Account');
        insert acc;

        Order__c order = new Order__c(Account__c = acc.Id);
        insert order;

        Product__c p = new Product__c(Name = 'Sample Product');
        insert p;

        Order_Item__c orderItem = new Order_Item__c(
            Order__c = order.Id,
            Product__c = p.Id
        );
        insert orderItem;
    }

    @isTest
    static void testGetOrderItems() {
        Order__c testOrder = [SELECT Id FROM Order__c];
        List<Order_Item__c> orderItems = OrderController.getOrderItems(
            testOrder.Id
        );
        System.assertEquals(orderItems.size(), 1);
    }
}