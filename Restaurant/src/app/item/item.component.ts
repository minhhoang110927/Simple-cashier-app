import { Component, OnInit } from '@angular/core';
import { ItemService } from '../shared/item.service';
import { ToastrService } from 'ngx-toastr';
import { Item } from '../shared/item.model';

@Component({
  selector: 'app-item',
  templateUrl: './item.component.html',
  styles: []
})
export class ItemComponent implements OnInit {

  constructor(public service: ItemService,
    private toastr: ToastrService) { }

  ngOnInit(): void {
    this.service.refreshList();
  }

  editItem(selectedRecord: Item) {
    this.service.formData = Object.assign({}, selectedRecord);
  }

  onDelete(id: number) {
    if (confirm('Are you sure to delete this record?')) {
      this.service.deleteIt(id).subscribe(
          res => {
            this.service.refreshList();
            this.toastr.warning("Deleted Successfully", "Restaurent App.");
          },
          err => { console.log(err) }
        )
    }
  }

}

