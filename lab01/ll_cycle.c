#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* your code here */
	node* hare = head;
	node* tortoise = head;

	

		while(hare != NULL){
		
		if(hare->next != NULL && hare->next->next != NULL)	

		hare = hare->next->next;
		tortoise = tortoise->next;
		if(hare == tortoise){
			return 1;
		}
	}

	
	
    return 0;
}
