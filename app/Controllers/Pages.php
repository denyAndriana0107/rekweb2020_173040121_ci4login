<?php namespace App\Controllers;

class Pages extends BaseController
{
	public function index()
	{
		$data=[
			'title'=>'Home | WebProgrammingUnpas',
		];
	
		return view('/pages/home',$data);
	}
	
	public function about(){
		$data=[
			'title'=>'About Me',
		];
		
		return view('/pages/about',$data);
	}	
	public function contact(){
		$data=[
			'title'=>'Contact us',
			'alamat'=>[
				[
					'tipe'=>'Rumah',
					'alamat'=>'Jalan Raya tarikolot No 121',
					'kota'=>'Majalengka',
				],
				[
					'tipe'=>'Kantor',
					'alamat'=>'Jalan Emen Slamet No 12',
					'kota'=>'Majalengka',
				],
			],
		];
		return view('pages/contact',$data);
	}
}
