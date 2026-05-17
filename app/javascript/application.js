// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./mobile_nav"

// Scroll-triggered fade-in animation
document.addEventListener("DOMContentLoaded", function () {
  // Fade-in for sections
  const animatedElements = document.querySelectorAll(".animate-on-scroll");

  const fadeObserver = new IntersectionObserver(
    (entries, observer) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.15 }
  );

  animatedElements.forEach((el) => fadeObserver.observe(el));

  // Skill bar load animation on scroll into view
  const skillBars = document.querySelectorAll(".skill-bar-fill");

  const skillObserver = new IntersectionObserver(
    (entries, observer) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          // Add animate class to trigger CSS animation
          skillBars.forEach((bar) => bar.classList.add("animate"));
          observer.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.3 }
  );

  // Observe the skills section
  const skillsSection = document.querySelector("#keahlian");
  if (skillsSection) {
    skillObserver.observe(skillsSection);
  }
});