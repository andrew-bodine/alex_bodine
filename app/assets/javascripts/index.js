window.addEventListener('load',
  function() {
    // setSectionHeight();
    resizeIndexImage();

    $('.album').each(
      function(index, hightlight) {
        $(hightlight).hover(
          function() {

            $(hightlight).find('album-label').removeClass('hidden');

          },
          function() {
            $(hightlight).find('album-label').addClass('hidden');
          }
        );
      }
    );
  }
);

window.addEventListener('resize',
  function() {
    // setSectionHeight();
    resizeIndexImage();
  }
);

function resizeIndexImage() {
  var indexImg = $('#indexImg');
  indexImg.height($(window).height());
}

// function scrollSections(event) {
//   event.preventDefault();
//   event.stopPropagation();

//   window.removeEventListener('scroll', this);

//   setVisibleSection($('.section'), window);

//   window.addEventListener('scroll', this);
 
//   return true;
// }

function setVisibleSection(sections, scroller) {
  this.scrollTops = (this.scrollTops) ? this.scrollTops : {};
  this.currentSection = (this.currentSection) ? this.currentSection : 0;
  newScrollTop = $(scroller).scrollTop();

  if(this.scrollTops[scroller]) {
    if(newScrollTop > this.scrollTops[scroller]) {
      this.currentSection += 1;
    } else if(newScrollTop < this.scrollTops[scroller]) {
      this.currentSection -= 1;
    }
  } else {
    if(newScrollTop > 0) {
      this.currentSection += 1;
    }
  }

  if(this.currentSection < 0) {
    this.currentSection = 0;
  }

  if(this.currentSection >= sections.length) {
    this.currentSection = sections.length - 1;
  }

  $('body').animate(
    {
      scrollTop: sections[this.currentSection].offsetTop
    },
    300
  );

  this.scrollTops[scroller] = $(scroller).scrollTop();
}

function setSectionHeight() {
  $('.section').each(
    function(index, element) {
      $(element).height($(window).height())
    }
  );
}

function viewAlbum(albumCover) {
  var
    pswpElement = document.querySelectorAll('.pswp')[0],
    items = [],
    entries = $(albumCover).find('.album-entries').find('img')
  ;

  entries.each(
    function(index, entry) {
      items.push(
        {
          src: entry.src,
          h: entry.height,
          w: entry.width
        }
      );
    }
  );

  var options = {
      index: 0 // start at first slide
  };

  var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
  gallery.init();
}
