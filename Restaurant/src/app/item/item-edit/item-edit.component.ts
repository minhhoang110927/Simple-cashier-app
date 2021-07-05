import { Component, OnInit } from '@angular/core';
import { ItemService } from '../../shared/item.service';
import { ToastrService } from 'ngx-toastr';
import { NgForm } from '@angular/forms';
import { Item } from 'src/app/shared/item.model';
import { ItemEdit } from 'src/app/shared/item-edit.model';

@Component({
  selector: 'app-item-edit',
  templateUrl: './item-edit.component.html',
  styles: []
})
export class ItemEditComponent implements OnInit {

  constructor(public service: ItemService,
    private toastr: ToastrService) { }

   
  ngOnInit(form?: NgForm): void {
    this.resetForm(form);
  }

  onSubmit(form: NgForm) {
      this.service.saveOrUpdateItem().subscribe(res => {
        this.resetForm(form);
        this.service.refreshList();
      })
    
  }
  resetForm(form?: NgForm) {
    if (form = null)
      form.resetForm();
    this.service.formData = {
      ItemID: null,
      Name: '',
      Price:0,
      DeletedItemIDs: ''
    };
    
  }
}
